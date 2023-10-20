require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3871.0.0-darwin-x64.tar.gz"
    sha256 "d8ffcb64acda0ca2c71a153532579b1341183369810e888ba7eeaf11d6f81042"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3871.0.0-darwin-arm64.tar.gz"
      sha256 "9b703f6e97841f08cb921b91741ba672f724a4cef6ed72e1199359c434fc682f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3871.0.0-linux-x64.tar.gz"
    sha256 "3cc89b6c3841911ae0fd6805803b83c7807fc6838f4e56f65fbd201f8c2b999e"
  end
  version "3871.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
