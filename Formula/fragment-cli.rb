require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-1-darwin-x64.tar.gz"
    sha256 "11abc0b77f1f0c00047025bf898708476d3ea2dcab87b5bb7aaedf8a50d33f36"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-1-darwin-arm64.tar.gz"
      sha256 "76b19b586d689bb2c3d2ff34a58e96e02094dcb622cc9f6b5ce8b5a5cd7b929d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-1-linux-x64.tar.gz"
    sha256 "2276a7a7de71427d0f7c320ad40bed66c9e70c77a1beac8c2857540b3436783f"
  end
  version "2023.10.19-1"
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
