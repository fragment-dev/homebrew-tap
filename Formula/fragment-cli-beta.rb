require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5211.0.0-darwin-x64.tar.gz"
    sha256 "dcedf152a30497edbc3af7b89062e9f4b8bb5bcb25b5ef7ee6a4cfc249102021"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5211.0.0-darwin-arm64.tar.gz"
      sha256 "36d149eabf1b221484b763fce1d677e7d0f49f15a24e863264305fc4a5b4587a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5211.0.0-linux-x64.tar.gz"
    sha256 "2965102e7a378f7f7d30191849d5cbb1735e68a46882ac48722884e44d75d26f"
  end
  version "5211.0.0"
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
