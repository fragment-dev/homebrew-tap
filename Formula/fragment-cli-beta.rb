require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3367.0.0-darwin-x64.tar.gz"
    sha256 "4534b30281a240861c99b95dc0a066077843af775ea60529b079269d36f7dd09"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3367.0.0-darwin-arm64.tar.gz"
      sha256 "d5a263deb662e1ed3149a209827ce069ffa588baf277b46c176b9cfe1128b011"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3367.0.0-linux-x64.tar.gz"
    sha256 "30e3b8252bedbcf98bb88b809de2f20a31b8a282354e7ded04ac8c0d5dc835a9"
  end
  version "3367.0.0"
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
