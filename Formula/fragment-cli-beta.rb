require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2505.0.0-darwin-x64.tar.gz"
    sha256 "450d8edd3b6699e3a1e65ea2586e04cf0c432861a9ce8c58174d09ec1862e577"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2505.0.0-darwin-arm64.tar.gz"
      sha256 "aa59472ae29f26c9c1c87640dc3b44f0f6e52bc7477c2c3be055f146f8d87daf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2505.0.0-linux-x64.tar.gz"
    sha256 "ce1406e05dcc62d6811edba5fb92425990bb59b205aa919afb11002dd9ac078f"
  end
  version "2505.0.0"
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
