require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4484.0.0-darwin-x64.tar.gz"
    sha256 "7676efe1287099527994cfb25959f9dc843a6500f7f6eec53b5395438312e484"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4484.0.0-darwin-arm64.tar.gz"
      sha256 "ff1bf79dbb65c543aa1156635e71d214d9c22b03574d60834b3115fdf19fe0a5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4484.0.0-linux-x64.tar.gz"
    sha256 "e8783d1213cdda1613ad8f1e827051ce2249dfe9869606e54b73438d35262ac5"
  end
  version "4484.0.0"
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
