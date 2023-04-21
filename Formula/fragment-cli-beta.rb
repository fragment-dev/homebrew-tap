require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2500.0.0-darwin-x64.tar.gz"
    sha256 "1d52980219161304ce056bfbad0ea5cc6423f7b2fa61ba020fe08446e2a46ad8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2500.0.0-darwin-arm64.tar.gz"
      sha256 "8c0fcd4a758e9b5e9b2d27675ac5a054b7fc4c806232884ba139caebad2f56ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2500.0.0-linux-x64.tar.gz"
    sha256 "75f41dfed035ecdda45f8185c8c57462ea175bd7c9d7f1c336b754fc3ab38f30"
  end
  version "2500.0.0"
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
