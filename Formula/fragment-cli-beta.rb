require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6280.0.0-darwin-x64.tar.gz"
    sha256 "0f33017e282e8d7ff62ec324ba2f78eb14e835aca4b09d262a3751942080e19f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6280.0.0-darwin-arm64.tar.gz"
      sha256 "cd807bd5774987bd588a22515731bef556f0ebe2a4d7c3e5d3d330f99d8aaa62"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6280.0.0-linux-x64.tar.gz"
    sha256 "4fbeaad7379a2c597c9f5c9dad977c2301711a1fcdb71c74788729fce157ca59"
  end
  version "6280.0.0"
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
