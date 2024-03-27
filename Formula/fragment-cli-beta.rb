require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4814.0.0-darwin-x64.tar.gz"
    sha256 "00c191a1ee85763a288bff0522f798886919675e48d054442cd19cdeb3571d16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4814.0.0-darwin-arm64.tar.gz"
      sha256 "5d36f936758e5b50d0ba27989a853abff98fde2179f791f9fe57fe5854efbe1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4814.0.0-linux-x64.tar.gz"
    sha256 "dd359581521308b335a7274fa559be4a3ada766861c8b2dcfae6224ac72a6228"
  end
  version "4814.0.0"
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
