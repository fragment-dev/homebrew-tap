require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3842.0.0-darwin-x64.tar.gz"
    sha256 "9a57be87ab354fe2a81b61435ff95967d5f888d794f3dd2fa2ffa4bf77e9b8c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3842.0.0-darwin-arm64.tar.gz"
      sha256 "48234feab008bc7f54ed372bfd44c3c20b0418cb793ac8d2889eb287d4487c1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3842.0.0-linux-x64.tar.gz"
    sha256 "68543c187f4b72271452eff9a088a029422c51e054a86c3792deab2a57257115"
  end
  version "3842.0.0"
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
