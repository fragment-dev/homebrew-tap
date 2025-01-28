require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6130.0.0-darwin-x64.tar.gz"
    sha256 "f80b1a2b435b695984bed4bf8ffcd00016c4f15ca727e358ba5122e4bb0a00b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6130.0.0-darwin-arm64.tar.gz"
      sha256 "eaae3d17509fad35a5aaa25d9d003201b67ed04c21edac15277b4fe9ecf0cb23"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6130.0.0-linux-x64.tar.gz"
    sha256 "fb0001766f9f2bcbcc31693656c3c6b67c11a059b0c9ca70be7c453575ad070c"
  end
  version "6130.0.0"
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
