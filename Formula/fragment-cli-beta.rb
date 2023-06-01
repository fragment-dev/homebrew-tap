require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2777.0.0-darwin-x64.tar.gz"
    sha256 "dda69aba3c93f77a2148803d9d93aafa1cae87a005b5ec54fdd31703ad907f01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2777.0.0-darwin-arm64.tar.gz"
      sha256 "824c04fed5ddb631b27a33884082f1bcec0c495ea5cd438b8f86d6c1ac384648"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2777.0.0-linux-x64.tar.gz"
    sha256 "ffb3227179505d934948b6a36234744114fcfab3a5d8e5697ece9cf18dcf1e4f"
  end
  version "2777.0.0"
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
