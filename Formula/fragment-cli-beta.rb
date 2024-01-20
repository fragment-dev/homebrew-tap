require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4381.0.0-darwin-x64.tar.gz"
    sha256 "54418bb822738ff90388e05c4295a2b3fc76c72fb3106eed8c07d3e9c5257f0a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4381.0.0-darwin-arm64.tar.gz"
      sha256 "6cbf4475ac5675a1494ebaa3b48274121362ba6b8a2f4caef231ccf3f7d64f99"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4381.0.0-linux-x64.tar.gz"
    sha256 "5958eac551ca10d5cf4f4938f085d3d5e41b396df1a75d4d0b4355a50e8f1fc4"
  end
  version "4381.0.0"
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
