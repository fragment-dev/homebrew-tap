require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2792.0.0-darwin-x64.tar.gz"
    sha256 "660b28befbde49b32a44e53528b6d536e14d7dbba6b1106173cdd4a230c80207"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2792.0.0-darwin-arm64.tar.gz"
      sha256 "033647481de9238ea3572349c975163e1462599c7fb4cff2e275522a30679f15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2792.0.0-linux-x64.tar.gz"
    sha256 "899fd65a801daa43d6edb544621c0328ab9caee9f22217f7b237819e51c325ae"
  end
  version "2792.0.0"
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
