require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3362.0.0-darwin-x64.tar.gz"
    sha256 "b5baf6ef9b83c5b6b8d93efe443947491436a78bef4ba5ee45a2d49a8a280bb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3362.0.0-darwin-arm64.tar.gz"
      sha256 "d4621a1b9fb0915afcb9e17b7e7de9f1c13e141d55c821248d585595422d5d96"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3362.0.0-linux-x64.tar.gz"
    sha256 "758b6e4e0094d9c3e7394c5babb0b4f5d40323723aba794c7462fcd967cd2fa0"
  end
  version "3362.0.0"
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
