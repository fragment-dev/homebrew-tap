require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4658.0.0-darwin-x64.tar.gz"
    sha256 "fa630d5d19e710928858240868ea417db0fe28e38040af80d50127b37e65c82e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4658.0.0-darwin-arm64.tar.gz"
      sha256 "633f2c346f70771f805fbbf5fa2019c130e33fa9ffbdfb487f6f7683cb9dd4f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4658.0.0-linux-x64.tar.gz"
    sha256 "6a8f20e57c0f7d14253d21f1d49274fbd4475862933e1fd9425e4d88e298ad47"
  end
  version "4658.0.0"
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
