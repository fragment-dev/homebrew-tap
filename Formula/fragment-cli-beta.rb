require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2499.0.0-darwin-x64.tar.gz"
    sha256 "2457b93f338da82fca5f563d85293f4c8ce4af8a1a56e45af4babe79e630a1c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2499.0.0-darwin-arm64.tar.gz"
      sha256 "14b4dacf402729e546c3eb8a7a7d656ae6402a8e1ef7c6ba66896aa1bd132ea5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2499.0.0-linux-x64.tar.gz"
    sha256 "d101d9fbd8fd8aa105731c13c1a41dd196e3078d65d50764b0592ec09d5d94dd"
  end
  version "2499.0.0"
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
