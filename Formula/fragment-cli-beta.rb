require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2489.0.0-darwin-x64.tar.gz"
    sha256 "397a6b90f530a3a54dc9156d1bda402d2f39764fa03af68269f917d1ebba5397"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2489.0.0-darwin-arm64.tar.gz"
      sha256 "37664a812889284884eed9f714bdc80bef8a1bac046ab15e8084b5f55873ee32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2489.0.0-linux-x64.tar.gz"
    sha256 "b611ef268373434a3dcdcc3f97438c96dea2d833a529144146e24a2d8a1019a4"
  end
  version "2489.0.0"
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
