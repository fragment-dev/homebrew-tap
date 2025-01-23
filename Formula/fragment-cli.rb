require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-1-darwin-x64.tar.gz"
    sha256 "79774c5c199b1a27087f1e74293f8a5cc26103f0e16887763aaa525ebc97651b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-1-darwin-arm64.tar.gz"
      sha256 "853ab4fb1660b8c0e89c5f173319935bc0fdcf912eae477d7221cb82dbd7f241"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.23-1-linux-x64.tar.gz"
    sha256 "d1b2efd4fd65d59f83b4e5a1d11d0d14f32a74b42fa7eb09dbeb8671547e2e11"
  end
  version "2025.1.23-1"
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
