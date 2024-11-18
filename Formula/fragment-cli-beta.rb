require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5790.0.0-darwin-x64.tar.gz"
    sha256 "aad111525e46a4563822e025649846f5cdd4f6245542aaf80a138cd20a2b0a2f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5790.0.0-darwin-arm64.tar.gz"
      sha256 "b8ae70cac83e27d21dbf5a82768d6a2792b23e39c0293caff867dc1efbd9b3d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5790.0.0-linux-x64.tar.gz"
    sha256 "5d60cd1c7471f12efa2130dd9272b3c623b9b70f328e69652513d6c9c4957062"
  end
  version "5790.0.0"
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
