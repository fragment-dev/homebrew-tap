require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-darwin-x64.tar.gz"
    sha256 "ca8c8f8e93e6ecec7336cfa9e82b6a781152158e3a1f6fef52a5a58d41ae63b7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-darwin-arm64.tar.gz"
      sha256 "e6efbb47c53cc65c2f2e84e68eb084a197908e5d1ca1fa53f25b0b07415317c7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.24-linux-x64.tar.gz"
    sha256 "113ba237116a564187fb95b53f70799c331729f7f1d1800edb797bda0d74e747"
  end
  version "2024.1.24"
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
