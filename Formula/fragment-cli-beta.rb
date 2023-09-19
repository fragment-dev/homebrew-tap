require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3612.0.0-darwin-x64.tar.gz"
    sha256 "38b1e540f04e6cdb0569c19cd1029c0e79c33c63520af977e4553ffce6046d90"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3612.0.0-darwin-arm64.tar.gz"
      sha256 "f6da725adfd44d2890b9c7c0dd72e691460828d826a7c1ec42065ed652772761"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3612.0.0-linux-x64.tar.gz"
    sha256 "a69791b329a5b64772d812b7908bd35aca1d00ccc1728759b2a107075e234fe2"
  end
  version "3612.0.0"
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
