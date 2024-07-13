require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5392.0.0-darwin-x64.tar.gz"
    sha256 "25ced300f481e1e0841b2d1ab7c2b26322108b27bbc7abf4e664d497669a8d9f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5392.0.0-darwin-arm64.tar.gz"
      sha256 "98db16b134c81b524ac97d4d3f00ef53ce1681b123f0168df73efc28e2152a96"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5392.0.0-linux-x64.tar.gz"
    sha256 "6dbc94c1337aecf162adb8eb3b65b4c332ba23270cf80bac1e944a007cfb5953"
  end
  version "5392.0.0"
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
