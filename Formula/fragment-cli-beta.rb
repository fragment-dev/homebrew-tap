require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2378.0.0-darwin-x64.tar.gz"
    sha256 "06af7d50dc7b41be1fee7822404dbed6dafb94c7b1e378730a61eac831587c3c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2378.0.0-darwin-arm64.tar.gz"
      sha256 "9ede92f65d9d4689b75f2009c74f9ce5cceba675e45d89112b3a1a783fc09fe7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2378.0.0-linux-x64.tar.gz"
    sha256 "1a8c72c9e268da9b91f578bd01c43b2199ec1fc5fdeac4544c27f3a2570c0363"
  end
  version "2378.0.0"
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
