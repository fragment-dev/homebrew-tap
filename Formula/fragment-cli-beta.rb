require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2887.0.0-darwin-x64.tar.gz"
    sha256 "f1d68edbd394537870e9e6b7d48a5c504cfe9a7240899d23a8692f3446d51cdb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2887.0.0-darwin-arm64.tar.gz"
      sha256 "3face8b17aa1cb8e9ec765df06d1989d538ce6d601011933f1f2ac4c90be2362"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2887.0.0-linux-x64.tar.gz"
    sha256 "c7225d876d4d11924cd1aa242e40361d45e4c6a5a3a61c7067cdb4a65c1388ee"
  end
  version "2887.0.0"
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
