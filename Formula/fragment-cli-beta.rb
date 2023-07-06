require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3008.0.0-darwin-x64.tar.gz"
    sha256 "8a9512f2ad8c1f127ef5e257ed905078dd0ddc6dc7dd6127ad9b6a512156a84d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3008.0.0-darwin-arm64.tar.gz"
      sha256 "fae8ff19a557f02e013932a210e575ae23e0d6ad9e29c30b7db0cc08f0f9e2e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3008.0.0-linux-x64.tar.gz"
    sha256 "ff11bcd154fe12d8f2c2be33579b6e06982cd82afdd70d63a4c091c3b50b36e3"
  end
  version "3008.0.0"
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
