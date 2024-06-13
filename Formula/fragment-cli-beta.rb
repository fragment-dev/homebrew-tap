require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5265.0.0-darwin-x64.tar.gz"
    sha256 "f3a1721ef4205a0ca3fa7c14d4b777a234e59f525f9fe566ddb18f1fd36a319d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5265.0.0-darwin-arm64.tar.gz"
      sha256 "b67e4640b98daf2f44b1a85fc211269be66dbd81f7f1f06dc152cc509e7906b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5265.0.0-linux-x64.tar.gz"
    sha256 "df29ecbdedfecb4dab4161b2c58d18af77a3562a9434e20ea37f60d9b526707e"
  end
  version "5265.0.0"
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
