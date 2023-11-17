<?php
define("SSLCZ_STORE_ID", "test");
define("SSLCZ_STORE_PASSWD", "qwerty");

define("SSLCZ_IS_SANDBOX", true);

define("SSLCZ_IS_LOCAL_HOST", true);

class SSLCommerz
{
    protected $sslc_submit_url;
    protected $sslc_validation_url;
    protected $sslc_mode;
    protected $sslc_data;
    protected $store_id;
    protected $store_pass;
    public $error = '';

    public function __construct()
    {
        $this->setSSLCommerzMode((SSLCZ_IS_SANDBOX) ? 1 : 0);
        $this->store_id = SSLCZ_STORE_ID;
        $this->store_pass = SSLCZ_STORE_PASSWD;
        $this->sslc_submit_url = "https://" . $this->sslc_mode . ".sslcommerz.com/gwprocess/v3/api.php";
        $this->sslc_validation_url = "https://" . $this->sslc_mode . ".sslcommerz.com/validator/api/validationserverAPI.php";
    }

    public function initiate($post_data, $get_pay_options = false)
    {
        if ($post_data != '' && is_array($post_data)) {

            $post_data['store_id'] = $this->store_id;
            $post_data['store_passwd'] = $this->store_pass;

            $load_sslc = $this->sendRequest($post_data);

            if ($load_sslc) {
                if (isset($this->sslc_data['status']) && $this->sslc_data['status'] == 'SUCCESS') {
                    if (!$get_pay_options) {
                        if (isset($this->sslc_data['GatewayPageURL']) && $this->sslc_data['GatewayPageURL'] != '') {
                            //header("Location: " . $this->sslc_data['GatewayPageURL']);
                            echo "
                                <script>
                                    window.location.href = '" . $this->sslc_data['GatewayPageURL'] . "';
                                </script>
                            ";
                            exit;
                        } else {
                            $this->error = "No redirect URL found!";
                            return $this->error;
                        }
                    } else {
                        $options = array();

                        # E WALLET GATEWAY
                        if (isset($this->sslc_data['gw']['mobilebanking']) && $this->sslc_data['gw']['mobilebanking'] != "") {
                            $sslcz_visa = explode(",", $this->sslc_data['gw']['mobilebanking']);
                            foreach ($sslcz_visa as $gw_value) {
                                if ($gw_value == 'dbblmobilebanking') {
                                    $options['mobile'][0]['name'] = "DBBL MOBILE BANKING";
                                    $options['mobile'][0]['link'] = "<a class='hvr-pop' href='" . $this->sslc_data['redirectGatewayURL'] . "dbblmobilebanking'><img style='width:60px; height:60px' src='" . $this->_get_image("dbblmobilebanking", $this->sslc_data) . "' alt='dbblmobilebanking'/></a>";
                                }

                                if ($gw_value == 'dana') {
                                    $options['mobile'][2]['name'] = "DANA";
                                    $options['mobile'][2]['link'] = "<a class='hvr-pop' href='" . $this->sslc_data['redirectGatewayURL'] . "dana'><img style='width:60px; height:60px' src='" . $this->_get_image("dana", $this->sslc_data) . "' alt='dana'/></a>";
                                }

                                if ($gw_value == 'shopeepay') {
                                    $options['mobile'][3]['name'] = "shopeepay";
                                    $options['mobile'][3]['link'] = "<a class='hvr-pop' href='" . $this->sslc_data['redirectGatewayURL'] . "shopeepay'><img style='width:60px; height:60px' src='" . $this->_get_image("shopeepay", $this->sslc_data) . "' alt='shopeepay'/></a>";
                                }

                                if ($gw_value == 'ovo') {
                                    $options['mobile'][4]['name'] = "ovo";
                                    $options['mobile'][4]['link'] = "<a class='hvr-pop' href='" . $this->sslc_data['redirectGatewayURL'] . "ovo'><img style='width:60px; height:60px' src='" . $this->_get_image("ovo", $this->sslc_data) . "' alt='ovo'/></a>";
                                }
                            }
                        } # END OF MOBILE BANKING

                        return $options;
                    }

                } else {

                    $this->error = "Invalid Credential!";
                    return $this->error;
                }

            } else {
                $this->error = "Connectivity Issue. Please contact your sslcommerz manager";
                return $this->error;
            }
        } else {
            $msg = "Please provide a valid information list about transaction with transaction id, amount, success url, fail url, cancel url, store id and pass at least";
            $this->error = $msg;
            return false;
        }

    }

    public function orderValidate($trx_id = '', $amount = 0, $currency = "IDR", $post_data)
    {
        if ($post_data == '' && $trx_id == '' && !is_array($post_data)) {
            $this->error = "Please provide valid transaction ID and post request data";
            return $this->error;
        }
        $validation = $this->validate($trx_id, $amount, $currency, $post_data);
        if ($validation) {
            return true;
        } else {
            return false;
        }
    }

    protected function sendRequest($data)
    {


        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $this->sslc_submit_url);
        curl_setopt($handle, CURLOPT_POST, 1);
        curl_setopt($handle, CURLOPT_POSTFIELDS, $data);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);


        $content = curl_exec($handle);


        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if ($code == 200 && !(curl_errno($handle))) {
            curl_close($handle);
            $sslcommerzResponse = $content;

            $this->sslc_data = json_decode($sslcommerzResponse, true);
            return $this;
        } else {
            curl_close($handle);
            $msg = "FAILED TO CONNECT WITH SSLCOMMERZ API";
            $this->error = $msg;
            return false;
        }
    }

    protected function setSSLCommerzMode($test)
    {
        if ($test) {
            $this->sslc_mode = "sandbox";
        } else {
            $this->sslc_mode = "securepay";
        }
    }

    protected function validate($merchant_trans_id, $merchant_trans_amount, $merchant_trans_currency, $post_data)
    {
        if ($merchant_trans_id != "" && $merchant_trans_amount != 0) {

            $post_data['store_id'] = $this->store_id;
            $post_data['store_pass'] = $this->store_pass;

            if ($this->SSLCOMMERZ_hash_varify($this->store_pass, $post_data)) {

                $val_id = urlencode(@$post_data['val_id']);
                $store_id = urlencode($this->store_id);
                $store_passwd = urlencode($this->store_pass);
                $requested_url = ($this->sslc_validation_url . "?val_id=" . $val_id . "&store_id=" . $store_id . "&store_passwd=" . $store_passwd . "&v=1&format=json");

                $handle = curl_init();
                curl_setopt($handle, CURLOPT_URL, $requested_url);
                curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);

                $result = curl_exec($handle);

                $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

                if ($code == 200 && !(curl_errno($handle))) {

                    # TO CONVERT AS OBJECT
                    $result = json_decode($result);
                    $this->sslc_data = $result;
                    $status = $result->status;
                    $tran_date = $result->tran_date;
                    $tran_id = $result->tran_id;
                    $val_id = $result->val_id;
                    $amount = $result->amount;
                    $store_amount = $result->store_amount;
                    $bank_tran_id = $result->bank_tran_id;
                    $card_type = $result->card_type;
                    $currency_type = $result->currency_type;
                    $currency_amount = $result->currency_amount;

                    # ISSUER INFO
                    $card_no = $result->card_no;
                    $card_issuer = $result->card_issuer;
                    $card_brand = $result->card_brand;
                    $card_issuer_country = $result->card_issuer_country;
                    $card_issuer_country_code = $result->card_issuer_country_code;

                    # API AUTHENTICATION
                    $APIConnect = $result->APIConnect;
                    $validated_on = $result->validated_on;
                    $gw_version = $result->gw_version;

                    # GIVE SERVICE
                    if ($status == "VALID" || $status == "VALIDATED") {
                        if ($merchant_trans_currency == "IDR") {
                            if (trim($merchant_trans_id) == trim($tran_id) && (abs($merchant_trans_amount - $amount) < 1) && trim($merchant_trans_currency) == trim('IDR')) {
                                return true;
                            } else {
                                # DATA TEMPERED
                                $this->error = "Data has been tempered";
                                return false;
                            }
                        } else {
                            //echo "trim($merchant_trans_id) == trim($tran_id) && ( abs($merchant_trans_amount-$currency_amount) < 1 ) && trim($merchant_trans_currency)==trim($currency_type)";
                            if (trim($merchant_trans_id) == trim($tran_id) && (abs($merchant_trans_amount - $currency_amount) < 1) && trim($merchant_trans_currency) == trim($currency_type)) {
                                return true;
                            } else {
                                $this->error = "Data has been tempered";
                                return false;
                            }
                        }
                    } else {
                        $this->error = "Failed Transaction";
                        return false;
                    }
                } else {
                    $this->error = "Faile to connect with SSLCOMMERZ";
                    return false;
                }
            } else {
                $this->error = "Hash validation failed";
                return false;
            }
        } else {
            $this->error = "Invalid data";
            return false;
        }
    }
    protected function SSLCOMMERZ_hash_varify($store_passwd = "", $post_data)
    {

        if (isset($post_data) && isset($post_data['verify_sign']) && isset($post_data['verify_key'])) {
            $pre_define_key = explode(',', $post_data['verify_key']);

            $new_data = array();
            if (!empty($pre_define_key)) {
                foreach ($pre_define_key as $value) {
                    if (isset($post_data[$value])) {
                        $new_data[$value] = ($post_data[$value]);
                    }
                }
            }
            $new_data['store_passwd'] = md5($store_passwd);

            ksort($new_data);

            $hash_string = "";
            foreach ($new_data as $key => $value) {
                $hash_string .= $key . '=' . ($value) . '&';
            }
            $hash_string = rtrim($hash_string, '&');

            if (md5($hash_string) == $post_data['verify_sign']) {

                return true;

            } else {
                $this->error = "Verification signature not matched";
                return false;
            }
        } else {
            $this->error = 'Required data mission. ex: verify_key, verify_sign';
            return false;
        }
    }
    protected function _get_image($gw = "", $source = array())
    {
        $logo = "";
        if (!empty($source) && isset($source['desc'])) {

            foreach ($source['desc'] as $key => $volume) {

                if (isset($volume['gw']) && $volume['gw'] == $gw) {

                    if (isset($volume['logo'])) {
                        $logo = str_replace("/gw/", "/gw1/", $volume['logo']);
                        break;
                    }
                }
            }
            return $logo;
        } else {
            return "";
        }
    }

    public function getResultData()
    {
        return $this->sslc_data;
    }
}

?>