require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4450.0.0-darwin-x64.tar.gz"
    sha256 "43d851077fe0f9f4d65c8bc6a599a965eaf5bfbb93c61dce3eb61749a8935f2e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4450.0.0-darwin-arm64.tar.gz"
      sha256 "ddea7bf43d38e5b95834206542b9c6266e1f423e8e86972dfd16a45cd97ef873"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4450.0.0-linux-x64.tar.gz"
    sha256 "497fc60cf4ca7119baf53ba000c4fbd34ffbf07b8abefe59e4dbd293c7634d2e"
  end
  version "4450.0.0"
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
