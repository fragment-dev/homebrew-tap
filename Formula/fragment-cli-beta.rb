require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4615.0.0-darwin-x64.tar.gz"
    sha256 "b49ceb99569f373b0d98238e8a32e5aa7730c64b6df9b48e011b167b46a8ff5b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4615.0.0-darwin-arm64.tar.gz"
      sha256 "624cb85596872cbad533bf274d2dbfda4a2f1fe85d83dcb5a6c75b9655a69269"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4615.0.0-linux-x64.tar.gz"
    sha256 "4dfe675cfcd0c10ac277eb7578a4523a0c2e10d96728fe2d03bd65758cc70eb0"
  end
  version "4615.0.0"
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
