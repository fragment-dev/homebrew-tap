require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-2-darwin-x64.tar.gz"
    sha256 "db5a66e47004bd98ee5dabc75cee05eacbd104df5a525c563a6bd62e5bd3f56b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-2-darwin-arm64.tar.gz"
      sha256 "b8d6bf1cdb9912c5df47aac1bde0df6952b341101ee7bfb1c24f9473f5eff457"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.12-2-linux-x64.tar.gz"
    sha256 "3b5677c4389dcfe00419b446b8af476eb6535841be5dff715e63dc3499b36c93"
  end
  version "2023.9.12-2"
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
