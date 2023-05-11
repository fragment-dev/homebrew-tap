require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2634.0.0-darwin-x64.tar.gz"
    sha256 "e835de4824d76f3718b963e8a3ff527ed007924d1ef7a9639be16dafec3295e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2634.0.0-darwin-arm64.tar.gz"
      sha256 "db1b5ef2084ea781e97870c05c8e05f262894b59bbb0554d25bd5a310862ccb5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2634.0.0-linux-x64.tar.gz"
    sha256 "64b34314128994d8679c1b20b18e9d500aeead4ba30e0f8dd300464c2f22b2a7"
  end
  version "2634.0.0"
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
