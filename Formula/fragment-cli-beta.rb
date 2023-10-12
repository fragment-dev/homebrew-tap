require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3808.0.0-darwin-x64.tar.gz"
    sha256 "873fb58655efc7c3d3dde3f1d741b383ab4eba4ea1e3e4dfd42a3f5c30ea9c97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3808.0.0-darwin-arm64.tar.gz"
      sha256 "cb690563514620c5f93491ba429149bad8367710d335619a1a7c123819e2c408"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3808.0.0-linux-x64.tar.gz"
    sha256 "d08679ffa9f3ba3265f444aca59abe6c14ed088532ad1b3a249d75abcc19a117"
  end
  version "3808.0.0"
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
