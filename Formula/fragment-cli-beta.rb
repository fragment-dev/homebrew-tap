require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2414.0.0-darwin-x64.tar.gz"
    sha256 "15b612fd9607df22abfb1d8943f701b0122921e2aba873d79c3fb063221ad2b1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2414.0.0-darwin-arm64.tar.gz"
      sha256 "65afee8bde4e1191744a432405a66399c39a10d1a07d9742c73f4361486a7688"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2414.0.0-linux-x64.tar.gz"
    sha256 "fc5efcdd2d7f26d40e0d53fa6ed043f95864e151c43bc86c311d20bad45e5932"
  end
  version "2414.0.0"
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
