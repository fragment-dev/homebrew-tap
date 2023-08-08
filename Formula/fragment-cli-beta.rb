require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3262.0.0-darwin-x64.tar.gz"
    sha256 "cb6f274e8c76ba71168c61759359465ee378e40adedf47837eeefcbdde20a5fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3262.0.0-darwin-arm64.tar.gz"
      sha256 "e6667f4d9f3474503c09f8f1b92b61694c178c5c0c52ab81c17a5d0012083497"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3262.0.0-linux-x64.tar.gz"
    sha256 "ba04ddc541233e265c15f1759f258aaadd3d7bed044f926eb64e28f6fe40d623"
  end
  version "3262.0.0"
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
