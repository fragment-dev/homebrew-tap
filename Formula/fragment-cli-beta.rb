require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4504.0.0-darwin-x64.tar.gz"
    sha256 "6a4f74c15f9ecddede6b27616dfa9e410c1b58abc7aa6772f5d1f6f4ddb66f7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4504.0.0-darwin-arm64.tar.gz"
      sha256 "4dc65f0299b113b5a3c01cb7ce7c808d8e40678dfe4ca0b349aeaf3b7164527a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4504.0.0-linux-x64.tar.gz"
    sha256 "8de4e0c9644a981de00bea8ac46c60f5827f12e9cce476309ce0b36d2c7bf29f"
  end
  version "4504.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
