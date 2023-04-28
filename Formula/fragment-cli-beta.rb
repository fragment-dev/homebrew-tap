require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2545.0.0-darwin-x64.tar.gz"
    sha256 "7e5ede8f51368dd7675bdecb465d7222484a112c522ad70ba5d2560bf7e1071b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2545.0.0-darwin-arm64.tar.gz"
      sha256 "e5d4810d291031a6ac92c4ab8e7fed44add30cd4a1ae1deec4bc38843b7968d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2545.0.0-linux-x64.tar.gz"
    sha256 "a7217b7d5528d16d458ad54e96c17eff12cb1cdbf80560e9af5d2e37356db143"
  end
  version "2545.0.0"
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
