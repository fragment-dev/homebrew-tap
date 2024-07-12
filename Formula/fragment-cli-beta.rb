require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5385.0.0-darwin-x64.tar.gz"
    sha256 "b1207304e97841f789334805494ad0f8c1d690e917fcebcaa53e323cd33fc0e3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5385.0.0-darwin-arm64.tar.gz"
      sha256 "50c4ea05fa74c3e3e22a31fbbfa666a4e876fc8f7d9f84518c7147c660801eb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5385.0.0-linux-x64.tar.gz"
    sha256 "330a51ea27997f0a88a37b4cb4f3993b4ce50ed1d1a65d7c157dc8a799edd714"
  end
  version "5385.0.0"
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
