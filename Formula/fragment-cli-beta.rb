require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2167.0.0-darwin-x64.tar.gz"
    sha256 "90b367178495f5da0376edf558e11eba032085f79722a3dee6977ec5333b4cb8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2167.0.0-darwin-arm64.tar.gz"
      sha256 "a7392af838850b3d8049936108db9e3562caf2a256b01af4cd3f570cbb21e5aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2167.0.0-linux-x64.tar.gz"
    sha256 "f39745eaa07f15629d4344bd0e49686acbb3213e938805c51e4d39776e68f06c"
  end
  version "2167.0.0"
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
