require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4846.0.0-darwin-x64.tar.gz"
    sha256 "e38f07bcf86eee53862109fe148c04e97ae173b712bc2107ac4c92290f6c7586"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4846.0.0-darwin-arm64.tar.gz"
      sha256 "b2bcd4c935e0c84464d4987406500e636e1c678acdb0dfe2651d70b132930a86"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4846.0.0-linux-x64.tar.gz"
    sha256 "e48b9d22aa91874972e86c634fec498b977f3183f741fe83f9f8356760f1e4d0"
  end
  version "4846.0.0"
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
