require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2229.0.0-darwin-x64.tar.gz"
    sha256 "9dd5f8720fb33b42b663f643c4c1db03961e4f4acefba7ae30c545162693ddb4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2229.0.0-darwin-arm64.tar.gz"
      sha256 "bc598f4704971a168e69d76618eaedd1d54cfc1ec4a64a601b8daf19603f4d5d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2229.0.0-linux-x64.tar.gz"
    sha256 "a01710611c199287fe00a35f4efc542021afc0a1aeafd1134c35f7218b4eb0b4"
  end
  version "2229.0.0"
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
