require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.16-2-darwin-x64.tar.gz"
    sha256 "3d6e43d6eab25f8c1470ae2f4552305bd1000916e07df5b3806abfb3742f028d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.16-2-darwin-arm64.tar.gz"
      sha256 "c6c967ea7bdbb8939cc49c8b693539e0a1254e5d0e24ba0c2441cf82b3d50330"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.16-2-linux-x64.tar.gz"
    sha256 "e86711931f6b141e8df1cd16c34bf530355730920ae77ab3cd310cbce15952aa"
  end
  version "2023.2.16-2"
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
