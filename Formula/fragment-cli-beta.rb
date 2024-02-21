require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4607.0.0-darwin-x64.tar.gz"
    sha256 "44bc25fe25dc25ab0b7eefd271cf97d6cfd65e6748924b4128581c3ea167b062"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4607.0.0-darwin-arm64.tar.gz"
      sha256 "a1826113312c18a39acfe5c98b9ce39d29c947c4e624a7971be7791f093f604b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4607.0.0-linux-x64.tar.gz"
    sha256 "fda0c75a974ef3ddd49da4c3e14369887925dd959aade5608a4d28547d7ff3a9"
  end
  version "4607.0.0"
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
