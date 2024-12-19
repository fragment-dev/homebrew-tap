require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5932.0.0-darwin-x64.tar.gz"
    sha256 "f456d5c74403cb905eff5e87eb18f9842746e88c489eb9c8d36a4d478c56ce28"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5932.0.0-darwin-arm64.tar.gz"
      sha256 "36afa4da755e946871c59dd6c4c31ad0497eafe38aab7f38f51bd46d0bca40e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5932.0.0-linux-x64.tar.gz"
    sha256 "74bba28dc0ab160940f8e0458a426ba53cc144ab7b0bd28b9904c6f5a639363d"
  end
  version "5932.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
