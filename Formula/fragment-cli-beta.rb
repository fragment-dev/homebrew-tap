require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3885.0.0-darwin-x64.tar.gz"
    sha256 "b478ec41174b2aa911efb8fd1f61b12c8bbdcba5d420dfff09db2e991c35d8b1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3885.0.0-darwin-arm64.tar.gz"
      sha256 "4217c522b0c34973ed15544ccdd9fc4ef08537ee95f19bbeda66c0e4c68a66f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3885.0.0-linux-x64.tar.gz"
    sha256 "d5c86ac8a93c4ce9e85df43b3ce88d55bb8afa2bf0fa5297c7af7b8feeaf2016"
  end
  version "3885.0.0"
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
