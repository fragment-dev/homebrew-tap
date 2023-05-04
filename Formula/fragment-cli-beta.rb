require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2580.0.0-darwin-x64.tar.gz"
    sha256 "c42e62539fbb182fe7ebbbf4a06153db00c1e525d5c55240feb4b77d62e94b13"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2580.0.0-darwin-arm64.tar.gz"
      sha256 "5571317d7f54bafcf1894849cf39adccfa75b5a247f4e52064b3774308e3540e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2580.0.0-linux-x64.tar.gz"
    sha256 "90469d489f65b1cabc80cb3b704fb258bc153d0e8dc3aa7ab5248196e54764bd"
  end
  version "2580.0.0"
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
