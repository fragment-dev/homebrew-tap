require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5916.0.0-darwin-x64.tar.gz"
    sha256 "f375332f3a548cb624c5f50f9e587260c3bb7ed4f35638913293aa142622f292"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5916.0.0-darwin-arm64.tar.gz"
      sha256 "b023303d06014d1495dd00529e31541ba5f969ffb6e16ea2203f614843cccc6a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5916.0.0-linux-x64.tar.gz"
    sha256 "a666993b77ed5bbe0751fd497ef7c9e7f5177faaa6a26df3aedfbb3dcf0c8d8d"
  end
  version "5916.0.0"
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
