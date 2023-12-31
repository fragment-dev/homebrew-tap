require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.31-darwin-x64.tar.gz"
    sha256 "eb039e1a1c9842df2dbec23a51e097193cfca48736f8482dfa9c6ea0833c529d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.31-darwin-arm64.tar.gz"
      sha256 "781c286ed08561da06b54e646aa26484915408357f17b7d4c50df1f4fb1a899d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.31-linux-x64.tar.gz"
    sha256 "7317f2d1cace6c0df2279baeca38d8991911c09d60bf40b696f62603b741e898"
  end
  version "2023.12.31"
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
