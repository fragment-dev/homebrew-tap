require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4057.0.0-darwin-x64.tar.gz"
    sha256 "8cfd2dc29ce932052ce7b04b0e83b79c8470e361870eea660cf3bce19e358d16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4057.0.0-darwin-arm64.tar.gz"
      sha256 "666fd053286491eadb71754e03fb87c9b7da77dab99e57749d804e8e748547e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4057.0.0-linux-x64.tar.gz"
    sha256 "c6b7e94020f836f31a9552ca2dc1f99bc434fd20635d099bf63c64be99cc3651"
  end
  version "4057.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
