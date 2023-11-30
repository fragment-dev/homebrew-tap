require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4072.0.0-darwin-x64.tar.gz"
    sha256 "ff9b8ac621816e3f7efc4ae619e9c610ba89cd752b91c2e43f1ec09f2c0eb8a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4072.0.0-darwin-arm64.tar.gz"
      sha256 "45bcef67f28926c55855204f0b04ae7b5178d2ebaea9aaa42deb9a18252ea210"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4072.0.0-linux-x64.tar.gz"
    sha256 "a6d32a4c63cad0988a7a9eed42b1e2552533c63e38c54078203027e3ee89e0e6"
  end
  version "4072.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
