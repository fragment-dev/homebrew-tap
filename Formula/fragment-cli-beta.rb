require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3440.0.0-darwin-x64.tar.gz"
    sha256 "aa30d27e16f4082c76b5b1d651a1f66dd821d6391cf86085e1ac80cd67630f45"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3440.0.0-darwin-arm64.tar.gz"
      sha256 "ceaccee89e30376b7f16259ef47e9e27c55803288f9f167629a49d0af56847be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3440.0.0-linux-x64.tar.gz"
    sha256 "5bc2ef1ddda31553691be0d2fcb839fffdaeddd54fae0d28ac91b99697cc5c34"
  end
  version "3440.0.0"
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
