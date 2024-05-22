require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5099.0.0-darwin-x64.tar.gz"
    sha256 "ea932da803e7044f5bb4bc5b8b3a8a47fe546d79111efc969f87959afd3a6f84"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5099.0.0-darwin-arm64.tar.gz"
      sha256 "4502d5898a582e11e608ae217ebac04e07aa31a27e7b06240effe721bba40acb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5099.0.0-linux-x64.tar.gz"
    sha256 "63f6bd9cff229978edcac0c66e327b76304edc6b88db1db5a2df0070072045f2"
  end
  version "5099.0.0"
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
