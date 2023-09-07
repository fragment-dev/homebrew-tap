require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3502.0.0-darwin-x64.tar.gz"
    sha256 "c26d9a3574215f5da61deed237ce3cca1605a5518b1400b7aafa52719b4f6f5b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3502.0.0-darwin-arm64.tar.gz"
      sha256 "8fe73a227b1d320c7d0476c950ae3603203d089be4d23b1fc62a8e4d50cbb428"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3502.0.0-linux-x64.tar.gz"
    sha256 "5e526e471b3ac7c5af95607a67d087b96c280e3b62fd440953aa740a5004cf6a"
  end
  version "3502.0.0"
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
