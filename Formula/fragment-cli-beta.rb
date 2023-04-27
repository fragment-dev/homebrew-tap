require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2533.0.0-darwin-x64.tar.gz"
    sha256 "7afbe737c646108dae9bb6926d55b9eb8b6ccf611e63703b29a6a06e76e2a0b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2533.0.0-darwin-arm64.tar.gz"
      sha256 "80b5a3e20faa0da4abc3cbc5e0b7061de5f4f4643de47a6424ef802b8d1d1e9a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2533.0.0-linux-x64.tar.gz"
    sha256 "971d061aa6a6430e0084f849f88ea8666dfc6d6e83b93f5502b33047e776e065"
  end
  version "2533.0.0"
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
