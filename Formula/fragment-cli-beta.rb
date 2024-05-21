require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5094.0.0-darwin-x64.tar.gz"
    sha256 "96f867da0b7667d54b0c1617952f21f0c5273a4d074dc94f24edfac4bd4d3033"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5094.0.0-darwin-arm64.tar.gz"
      sha256 "394338940af71dbf38ceb3e1a079f5beabf51039b106f62de582ac7322cb6fd5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5094.0.0-linux-x64.tar.gz"
    sha256 "3a56ac337561d4de840748ae1677285f2f03b6f226ca2d2ca49024552ce6047c"
  end
  version "5094.0.0"
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
